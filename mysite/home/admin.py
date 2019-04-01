from django.contrib import admin

# Register your models here.
from .models import ServiceProvider,Admin,Customer

admin.site.register(ServiceProvider)
admin.site.register(Admin)
admin.site.register(Customer)
