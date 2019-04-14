from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect,get_object_or_404
from django.contrib import messages

# Create your views here.
from .forms import NewServiceProvider, NewUser, ServiceProviderProfile, CustomerProfile,\
    requestForm,Req, NewMessage, Todo, NewTodo
import datetime
from .models import ServiceProvider, Customer


def request_complete(request, pk):
    if request.method == "GET":
        obj = Req.objects.get(id=pk)
        obj1 = ServiceProvider.objects.get(id=obj.sp_id)
        obj.status = "complete"
        obj.save()
        form = ServiceProviderProfile(request.POST, instance=obj1)

        return render(request, 'sheba/request_complete.html', {'request': obj, 'sp': obj1, 'form': form})



def todo_mark(request,pk):
    obj = Todo.objects.get(id=pk)
    obj.status = 1
    obj.save()
    return redirect('/ongoing_request')


def todo_delete(request,pk):
    obj = Todo.objects.get(id=pk)
    obj.delete()
    return redirect('/ongoing_request')


def todo_add(request,pk):
    mutable = request.POST._mutable
    request.POST._mutable = True
    request.POST['req_id'] = pk
    request.POST._mutable = mutable
    if request.method == "POST":
        form = NewTodo(request.POST)
        if form.is_valid():
            print("valid")
            form.save()

    return redirect('/ongoing_request')


def ongoing_request(request):
    message_form = NewMessage()
    if request.session['type'] == "user":
        requested = User.objects.raw('SELECT * FROM req WHERE status LIKE ("confirmed") and customer=%s LIMIT 1',
                                     [request.session['user']])
    else:
        requested = User.objects.raw('SELECT * FROM req WHERE status LIKE ("confirmed") and sp_id=%s LIMIT 1',
                                     [request.session['user']])
        obj = ServiceProvider.objects.get(id=request.session['user'])
        if obj.status == "pending":
            return redirect('/available_request')
    try:
        reqid = requested[0].id
        todo_form = NewTodo()
        interested_sp = requested[0].sp_id
        user = requested[0].customer
        user_message = User.objects.raw(
            'SELECT * FROM home_messagesuser WHERE (sender LIKE (%s) and reciever LIKE (%s)) or (reciever LIKE (%s) and sender LIKE (%s)) ORDER BY time ASC LIMIT 50',
                [user, interested_sp, user, interested_sp])

        todo_list = User.objects.raw(
            'SELECT * FROM todo WHERE req_id = %s', [reqid])

        if request.method == "GET":
            # print(request.session['type'])
            return render(request, 'sheba/ongoing_request.html',
                          {'request': requested, 'user_messages': user_message, 'form': message_form,
                           'user': request.session['user'], 'type': request.session['type'], 'todo': todo_form ,
                           'todo_list': todo_list})
        else:
            mutable = request.POST._mutable
            print(request.POST)
            request.POST._mutable = True
            request.POST['sender'] = request.session['user']
            if request.session['type'] == "user":
                request.POST['reciever'] = interested_sp
            else:
                request.POST['reciever'] = requested[0].customer

            request.POST['time'] = datetime.datetime.now()
            request.POST._mutable = mutable
            form = NewMessage(request.POST)
            if request.method == "POST":
                if form.is_valid():
                    form.save()
                    return redirect('/ongoing_request')

    except IndexError:
        return render(request, 'sheba/request.html', {'found': "ok"})

    return render(request, 'sheba/ongoing_request.html',
                  {'request': requested, 'user_messages': user_message, 'form': message_form,
                   'user': request.session['user'],'type': request.session['type'],  'todo': todo_form,
                   'todo_list': todo_list})


def refresh_check(request):
    print("_______==========__________")


def delete_request(request, pk):
    try:
        to_update = Req.objects.get(id=pk)  # object to update
        to_update.delete()
    except ObjectDoesNotExist:
        return redirect('/request/')

    return redirect('/request/')


def decline_request(request, pk):
    to_update = Req.objects.get(id=pk)  # object to update
    to_update.status = "pending"
    sp = ServiceProvider.objects.get(id=to_update.sp_id)
    sp.status = "pending"
    to_update.sp_id = ""
    to_update.save()
    sp.save()
    return redirect('/searching_service_provider')


def searching_service_provider(request):
    requested = User.objects.raw(
        'SELECT *,count(*) as cnt FROM req WHERE status LIKE ("pending") or status LIKE ("confirmed") and customer=%s LIMIT 1'
        , [request.session['user']]
    )  # checking request status "pending" or "requested"
    if requested[0].cnt == 0:
        print(requested[0].cnt)
        return redirect('/request/')

    interested = User.objects.raw(
        'SELECT * FROM req WHERE status LIKE ("confirmed") and customer=%s LIMIT 1', [request.session['user']]
    )

    try:
        interested_sp = interested[0].sp_id
        service_provider = ServiceProvider.objects.get(id=interested_sp)
        return render(request, 'sheba/searching_service_provider.html', {'request': interested,
                                                                         'service_provider': service_provider,
                                                                         'found': "found"})

    except IndexError:
        return render(request, 'sheba/searching_service_provider.html', {'request': requested, 'found': "notfound"})



def home(request):
    try:
        return render(request, 'sheba/home.html', {'user_type': request.session['type']})
    except KeyError:
        return render(request, 'sheba/home.html', {'user_type': "not_logged"})


def sp_request(request, pk):
    to_update = Req.objects.get(id=pk)  # object to update
    request.session['key'] = pk
    print(pk)
    to_update.status = "confirmed"
    to_update.sp = ServiceProvider.objects.get(id=request.session['user'])  # creating foreign key
    user = to_update.customer
    to_update.save()  # save object

    sp = ServiceProvider.objects.get(id=request.session['user'])
    sp.status = "confirmed"
    sp.save()

    # foo_instance = Todo.objects.create(req_id=pk)
    # foo_instance.save()

    return redirect('/ongoing_request')


def request_details(request, pk):
    to_update = Req.objects.get(id=pk)  # object to update
    user_details = User.objects.raw(
        'SELECT *, id FROM customer WHERE id LIKE (%s)', [to_update.customer]
    )
    for user in user_details:
        print(user.first_name)
    return render(request, 'sheba/request_details.html', {'details': to_update, 'user': user_details})


def available_request(request):

    to_update = ServiceProvider.objects.get(id=request.session['user'])
    lat1 =to_update.lat
    lon1 = to_update.lon

    if to_update.status != "pending":
        return redirect('/ongoing_request')

    all_req = User.objects.raw(
            'SELECT *, (6371 *acos(cos(radians(%s)) * cos(radians(lat)) * cos(radians(lon) - radians(%s)) + sin(radians(%s)) * sin(radians(lat )))) AS distance FROM req WHERE status LIKE("Pending") HAVING distance < 1.3  ORDER BY distance LIMIT 0, 20',[lat1, lon1, lat1])
    return render(request, 'sheba/available_request.html', {'all_req': all_req})


def logout(request):
    del request.session['user']
    del request.session['type']

    return redirect('/')


def profile(request):
    user = True
    try:
       pk = request.session['user']
    except KeyError:
        return redirect('/login/')

    try:
        obj = ServiceProvider.objects.get(pk=request.session['user'])
    except ObjectDoesNotExist:
        obj = Customer.objects.get(pk=request.session['user'])
        user = False

    if request.method == 'POST':
        if user:
            form = ServiceProviderProfile(request.POST, request.FILES, instance=obj)

        else:
            form = CustomerProfile(request.POST, request.FILES, instance=obj)

        if form.is_valid():
            form.save()
            print(form)

        return render(request, 'sheba/profile.html', {'form': form, 'user': obj,'user_type': request.session['type']})
    else:
        if user:
            form = ServiceProviderProfile()
        else:
            form = CustomerProfile()
            user = False

        return render(request, 'sheba/profile.html', {'form': form, 'user': obj,'user_type': request.session['type']})


def user_login(request):
    if request.method == 'POST':
        pk = request.POST["id"]
        password = request.POST["password"]
        print(pk, password)
        found = False
        user_check = User.objects.raw(
            'SELECT id , password FROM Customer WHERE id=%s AND password=%s',
            [pk, password])
        sp_check = User.objects.raw(
            'SELECT id , password FROM service_provider WHERE id=%s AND password=%s',
            [pk, password])

        for i in user_check:
            request.session['type'] = "user"
            found = True
        for i in sp_check:
            request.session['type'] = "service_provider"
            found = True
        if found:
            request.session['user'] = pk
            return render(request, 'sheba/home.html', {'user_type': request.session['type']})

        else:
            print("FAILED")
            return render(request, 'sheba/user_login.html', {'valid': found})
    else:

        try:
            pk = request.session['user']
            return render(request, 'sheba/home.html', {'user_type': request.session['type']})
        except KeyError:
            return render(request, 'sheba/user_login.html', {'valid': True})


def sp_signup(request):
    if request.method == "POST":
        form = NewServiceProvider(request.POST)
        if form.is_valid():
            print("valid")
            form.save()
            return redirect('/')

    else:
        form = NewServiceProvider()
    return render(request, 'sheba/sp_signup.html', {'form': form})


def user_signup(request):
    if request.method == "POST":
        form = NewUser(request.POST)
        if form.is_valid():
            print("valid")
            form.save()
            return redirect('/')

        else:
            print("not valid")
            messages.error(request, 'User already exist')
    else:
        form = NewUser()

    return render(request, 'sheba/user_signup.html', {'form': form})


def user_request_valid(request):
    requested = User.objects.raw(
        'SELECT *,count(*) as cnt FROM req WHERE status NOT LIKE ("complete") and customer=%s LIMIT 1',
        [request.session['user']]
    )  # checking if user currently has ongoing or requested or pending "request"
    print("**********____________________*****************")
    if requested[0].cnt > 0:
        print(requested[0].cnt)
        return False
    return True


def request(request):
    if request.method == 'GET':
        if not user_request_valid(request):
            return redirect('/searching_service_provider/')
        form = requestForm()
    else:
        mutable = request.POST._mutable
        request.POST._mutable = True
        request.POST['customer'] = request.session['user']
        request.POST['status'] = "pending"
        print(datetime.datetime.now().time())
        request.POST._mutable = mutable

        form = requestForm(request.POST)
        if form.is_valid():
            if user_request_valid(request):
                form.save()
            print("valid")
            print(form)
            return redirect('/searching_service_provider/')  # redirect to request searching page

        else:
            messages.error(request, 'something went wrong')
    return render(request, 'sheba/request.html', {'form': form})


def history(request):
    cus_id_his = '\0'
    sp_id_his = '\0'
    try:
        obj = ServiceProvider.objects.get(pk=request.session['user'])
        form = ServiceProviderProfile()
        sp_id_his = obj.id
    except ObjectDoesNotExist:
        obj = Customer.objects.get(pk=request.session['user'])
        form = CustomerProfile()
        cus_id_his = obj.id
    all_his = User.objects.raw(
        'SELECT * FROM req'
    )

    return render(request, 'sheba/history.html', {'all_his':all_his})
