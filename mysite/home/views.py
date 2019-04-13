from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect,get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
import connection

# Create your views here.
from .forms import NewServiceProvider, NewUser, ServiceProviderProfile, CustomerProfile, requestForm,Req, NewMessage
from .models import ServiceProvider, Customer
import datetime


def request_searching(request):
    message_form = NewMessage()
    customer = "customer"
    requested = User.objects.raw(
        'SELECT * FROM req WHERE status LIKE ("requested") and customer=%s LIMIT 1', [request.session['user']]
    )
    try:
        interested_sp = requested[0].sp_id
        user_message = User.objects.raw(
            'SELECT * FROM home_messagesuser WHERE sender LIKE (%s) and reciever LIKE (%s) ORDER BY time DESC LIMIT 5',
                [request.session['user'], interested_sp])
        sp_message = User.objects.raw(
            'SELECT * FROM home_messagesuser WHERE reciever LIKE (%s) and sender LIKE (%s) ORDER BY time ASC LIMIT 5',
                [request.session['user'], interested_sp])

        if request.method == "GET":
            return render(request, 'sheba/request_searching.html',
                      {'request': requested, 'user_messages': user_message, 'sp_messages': sp_message, 'form': message_form})
        else:
            mutable = request.POST._mutable
            print(request.POST)
            request.POST._mutable = True
            request.POST['sender'] = request.session['user']
            request.POST['reciever'] = interested_sp
            request.POST['time'] = datetime.datetime.now()
            request.POST._mutable = mutable
            form = NewMessage(request.POST)
            if request.method == "POST":
                if form.is_valid():
                    form.save()
                    return redirect('/request_searching/')
    except IndexError:
        return render(request, 'sheba/request_searching.html', {'found': "ok"})

    return render(request, 'sheba/request_searching.html',
                  {'request': requested, 'user_messages': user_message, 'sp_messages': sp_message,'form': message_form})


def home(request):
    try:
        return render(request, 'sheba/home.html', {'user_type': request.session['type']})
    except KeyError:
        return render(request, 'sheba/home.html', {'user_type': "not_logged"})


def sp_request(request, pk):
    to_update = Req.objects.get(id=pk)  # object to update
    request.session['key'] = pk
    print(pk)
    to_update.status = "requested"
    to_update.sp = ServiceProvider.objects.get(id=request.session['user'])  # creating foreign key
    user = to_update.customer
    to_update.save()  # save object

    message_form = NewMessage()

    user_message = User.objects.raw(
        'SELECT * FROM home_messagesuser WHERE sender LIKE (%s) and reciever LIKE (%s) ORDER BY time DESC LIMIT 5',
            [request.session['user'], user])
    sp_message = User.objects.raw(
        'SELECT * FROM home_messagesuser WHERE reciever LIKE (%s) and sender LIKE (%s) ORDER BY time ASC LIMIT 5',
            [request.session['user'], user])

    if request.method == "GET":
        return render(request, 'sheba/available_request.html',
                  {'request': to_update, 'user_messages': user_message, 'sp_messages': sp_message, 'form': message_form})
    else:
        mutable = request.POST._mutable
        print(request.POST)
        request.POST._mutable = True
        request.POST['sender'] = request.session['user']
        request.POST['reciever'] = user
        request.POST['time'] = datetime.datetime.now()
        request.POST._mutable = mutable
        form = NewMessage(request.POST)
        if request.method == "POST":
            if form.is_valid():
                form.save()
                return render(request, 'sheba/available_request.html',
                              {'request': to_update, 'user_messages': user_message, 'sp_messages': sp_message,
                               'form': message_form})
    return render(request, 'sheba/available_request.html',
                  {'request': to_update, 'user_messages': user_message, 'sp_messages': sp_message,'form': message_form})


def available_request(request):
    to_update = ServiceProvider.objects.get(id=request.session['user'])
    lat1 =to_update.lat
    lon1 = to_update.lon
    all_req = User.objects.raw(
            'SELECT *, (6371 *acos(cos(radians(%s)) * cos(radians(lat)) * cos(radians(lon) - radians(%s)) + sin(radians(%s)) * sin(radians(lat )))) AS distance FROM req WHERE status LIKE("Pending") HAVING distance < 1.3  ORDER BY distance LIMIT 0, 20',[lat1, lon1, lat1])
    return render(request, 'sheba/available_request.html', {'all_req' : all_req})


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
        return render(request, 'sheba/profile.html', {'form': form, 'user': obj})
    else:
        if user:
            form = ServiceProviderProfile()
        else:
            form = CustomerProfile()
            user = False

        return render(request, 'sheba/profile.html', {'form': form, 'user': obj})


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


def request(request):
    if request.method == 'GET':
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

            print("valid")
            # form.data['customer'] = "123"
            print(form)
            form.save()
            # return render(request, 'sheba/user_homepage.html', {'cus_id': request.session['type']})

        else:
            print("not valid")
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
