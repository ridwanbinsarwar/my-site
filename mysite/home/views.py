from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect,get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
import pymysql
# Create your views here.
from .forms import NewServiceProvider, NewUser, ServiceProviderProfile, CustomerProfile, requestForm,Req
from .models import ServiceProvider, Customer
import datetime


def home(request):
    try:
        return render(request, 'sheba/home.html', {'user_type': request.session['type']})
    except KeyError:
        return render(request, 'sheba/home.html', {'user_type': "not_logged"})


def sp_request(request, pk):
    to_update = Req.objects.get(id=pk)  # object to update
    to_update.service_type = 6  # update name
    to_update.save()  # save object
    post = get_object_or_404(Req, pk=pk)
    id = post.location
    return redirect('/available_request/')


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
        # form = ServiceProviderProfile()
    except ObjectDoesNotExist:
        obj = Customer.objects.get(pk=request.session['user'])
        # form = CustomerProfile()
        user = False

    if request.method == 'POST':
        if user:
            form = ServiceProviderProfile(request.POST, request.FILES, instance=obj)
        else:
            form = CustomerProfile(request.POST, instance=obj)

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
            #form.data['customer'] = "123"
            print(form)
            form.save()
            #return render(request, 'sheba/user_homepage.html', {'cus_id': request.session['type']})

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
