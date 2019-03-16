from django.contrib.auth.models import User
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect

# Create your views here.
from .forms import UserLogin


def home(request):
    return render(request, 'sheba/home.html', {})


def user_login(request):
    return render(request, 'sheba/login.html', {})


def check_email_password(request):
    pk = request.POST["user_email"]
    password = request.POST["user_password"]
    found = False
    user_check = User.objects.raw(
        'SELECT user_email AS id, user_password, user_type FROM users WHERE user_email=%s AND user_password=%s',
        [pk, password])
    for i in user_check:
        found = True
    if found:
        print("SUCCESSFUL")
    else:
        print("FAILED")
    return render(request, 'sheba/login.html', {"valid": found})


