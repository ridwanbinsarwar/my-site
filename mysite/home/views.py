from django import forms
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
# Create your views here.
from .forms import NewServiceProvider, NewUser, ServiceProviderProfile, CustomerProfile
from .models import ServiceProvider, Customer


def home(request):
    return render(request, 'sheba/home.html', {})


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
            'SELECT id , password FROM users WHERE id=%s AND password=%s',
            [pk, password])
        sp_check = User.objects.raw(
            'SELECT id , password FROM service_provider WHERE id=%s AND password=%s',
            [pk, password])

        for i in user_check:
            found = True
        for i in sp_check:
            found = True
        if found:
            request.session['user'] = pk
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
