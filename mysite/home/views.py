from django import forms
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
# Create your views here.
from .forms import UserLogin, NewServiceProvider, NewUser, ServiceProviderProfile, CustomerProfile
from .models import Users, ServiceProvider, Customer

LOGGED_IN = "-1"
USER = True


def home(request):
    #checking commit
    return render(request, 'sheba/home.html', {})


def logout(request):
    global LOGGED_IN,USER
    LOGGED_IN = "-1"
    USER = True
    return redirect('/')


def profile(request):
    global LOGGED_IN,USER

    if LOGGED_IN == "-1":
        return redirect('/login/')

    if not USER:
        obj = ServiceProvider.objects.get(pk=LOGGED_IN)
        form = ServiceProviderProfile()
    else:
        obj = Customer.objects.get(pk=LOGGED_IN)
        form = CustomerProfile()

    if request.method == 'POST':
        if not USER:
            form = ServiceProviderProfile(request.POST, instance=obj)
        else:
            form = CustomerProfile(request.POST, instance=obj)

        if form.is_valid():
            form.save()
        print(form)
    return render(request, 'sheba/profile.html', {'form': form, 'user': obj})


def user_login(request):

    if request.method =='POST':
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
            found = True
        for i in sp_check:
            global USER
            USER = False
            found = True
        if found:
            global LOGGED_IN
            LOGGED_IN = pk
            return redirect('/profile/')  # since name="website"

        else:
            print("FAILED")
            return render(request, 'sheba/user_login.html', {'valid': found})

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


