from django.db import models
from geopy import geocoders


# Create your models here.
class MessagesUser(models.Model):
    id = models.AutoField(primary_key=True)
    sender = models.CharField(max_length=50, blank=True, null=True)
    reciever = models.CharField(max_length=50, blank=True, null=True)
    details = models.CharField(max_length=255, blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'home_messagesuser'

    def __str__(self):
        return self.id


class Admin(models.Model):
    id = models.CharField(db_column='ID', max_length=30, blank=True, null=False, primary_key=True)  # Field name made lowercase.
    password = models.CharField(max_length=30, blank=True, null=True)
    role = models.CharField(max_length=10, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    contact_no = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'admin'

    def __str__(self):
        return self.id


class Customer(models.Model):
    id = models.CharField(db_column='ID', primary_key=True, max_length=30)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    birth_day = models.DateField()
    email = models.CharField(max_length=50, blank=True, null=False)
    contact_no = models.CharField(max_length=11, blank=False, null=False)
    city = models.CharField(max_length=50)
    nid = models.IntegerField(db_column='NID', blank=True, null=False)  # Field name made lowercase.
    rating = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=False, null=False)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')


    class Meta:
        managed = False
        db_table = 'customer'

    def __str__(self):
        return self.id


class ServiceProvider(models.Model):
    id = models.CharField(db_column='ID', unique=True, max_length=30, blank=False, null=False, primary_key=True)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    birth_day = models.DateField()
    email = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    contact_no = models.CharField(max_length=11, blank=True, null=False)
    nid = models.IntegerField(db_column='NID', blank=True, null=False)  # Field name made lowercase.
    service_type = models.CharField(max_length=1, blank=True, null=False)
    rating = models.IntegerField(blank=True, null=True)
    verified = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=False, null=False)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')
    lat = models.FloatField()
    lon = models.FloatField()
    radius = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'service_provider'

    def __str__(self):
        return self.id

class Location(models.Model):
    location = models.CharField(primary_key=True, max_length=25)
    street = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location'


class Req(models.Model):
    location = models.CharField(max_length=150, blank=True, null=True)
    service_type = models.IntegerField(blank=True, null=True)
    customer = models.CharField(max_length=30, blank=True, null=True)
    status = models.CharField(max_length=30, blank=True, null=False)
    start_time = models.CharField(max_length=20)
    end_time = models.CharField(max_length=20)
    sp = models.ForeignKey('ServiceProvider', models.DO_NOTHING, blank=True, null=True)
    lat = models.FloatField()
    lon = models.FloatField()
    radius = models.IntegerField()


    class Meta:
        managed = False
        db_table = 'req'

    def __str__(self):
        return self.id


