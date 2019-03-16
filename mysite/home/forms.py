from django import forms
from .models import Users


class UserLogin(forms.ModelForm):
    class Meta:
        model = Users
        fields = ('user_email', 'user_password')
