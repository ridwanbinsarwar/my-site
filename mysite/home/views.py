from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
# Create your views here.
from .forms import NewServiceProvider, NewUser, ServiceProviderProfile, CustomerProfile, requestForm
from .models import ServiceProvider, Customer
import datetime

def home(request):
    return render(request, 'sheba/home.html', {})


def available_request(request):
    if request.method == 'POST':
        p = request.POST

        print(p.get('service_type', False))
    obj = ServiceProvider.objects.get(pk=request.session['user'])
    form = ServiceProviderProfile()
    type = obj.service_type
    all_req =  User.objects.raw(
            'SELECT * FROM req WHERE status LIKE ("pending") AND service_type = %s',[type]
            )

    return render(request, 'sheba/available_request.html', {'all_req' : all_req})


def logout(request):
    del request.session['user']
    return redirect('/')


def profile(request):
    user = True
    try:
       pk = request.session['user']
    except KeyError:
        return redirect('/login/')

    try:
        obj = ServiceProvider.objects.get(pk=request.session['user'])
        form = ServiceProviderProfile()
    except ObjectDoesNotExist:
        obj = Customer.objects.get(pk=request.session['user'])
        form = CustomerProfile()
        user = False

    if request.method == 'POST':
        if user:
            form = ServiceProviderProfile(request.POST, instance=obj)
        else:
            form = CustomerProfile(request.POST, instance=obj)

        if form.is_valid():
            form.save()
        print(form)
    return render(request, 'sheba/profile.html', {'form': form, 'user': obj})


def user_login(request):
    if request.method == 'POST':
        pk = request.POST["id"]
        password = request.POST["password"]

        found = False
        user_check = User.objects.raw(
            'SELECT id , password FROM Customer WHERE id=%s AND password=%s',
            [pk, password])
        sp_check = User.objects.raw(
            'SELECT id , password FROM service_provider WHERE id=%s AND password=%s',
            [pk, password])

        cus_id = False
        for i in user_check:
            cus_id = True
            found = True
        for i in sp_check:
            found = True
        if found:
            global LOGGED_IN
            LOGGED_IN = pk

            request.session['user'] = pk
            request.session['type'] = cus_id

            print(cus_id)
            return render(request,'sheba/user_homepage.html', {'cus_id':request.session['type']})

        else:
            print("FAILED")
            return render(request, 'sheba/user_login.html', {'valid': found})
    else:

        try:
            pk = request.session['user']
            return render(request, 'sheba/user_homepage.html', {'cus_id': request.session['type']})
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


def homepage(request):
    #checking commit
    #commit check1234
    return render(request, 'sheba/user_homepage.html', {})
def sp_homepage(request):
    #checking commit
    #commit check1234
    return render(request, 'sheba/sp_homepage.html', {})

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
            #form.data['customer'] = "123"
            print(form)
            form.save()
            #return render(request, 'sheba/user_homepage.html', {'cus_id': request.session['type']})


        else:
            print("not valid")
            messages.error(request, 'something went wrong')
    return render(request, 'sheba/request.html',{'form':form})

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
        'SELECT * FROM req WHERE status LIKE ("complete") AND (customer=%s OR sp_id=%s)',[cus_id_his,sp_id_his]
    )

    return render(request, 'sheba/history.html', {'all_his':all_his})