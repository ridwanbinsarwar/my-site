from django.db import models




# Create your models here.
class Users(models.Model):
    user_email = models.CharField(primary_key=True, max_length=255)
    user_password = models.CharField(max_length=255)
    user_type = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'users'


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
    email = models.CharField(max_length=50, blank=True, null=False)
    contact_no = models.CharField(max_length=11, blank=False, null=False)
    city = models.CharField(max_length=50)
    nid = models.IntegerField(db_column='NID', blank=True, null=False)  # Field name made lowercase.
    rating = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=False, null=False)

    class Meta:
        managed = False
        db_table = 'customer'

    def __str__(self):
        return self.id


class ServiceProvider(models.Model):
    id = models.CharField(db_column='ID', unique=True, max_length=30, blank=False, null=False, primary_key=True)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    contact_no = models.CharField(max_length=11, blank=True, null=False)
    nid = models.IntegerField(db_column='NID', blank=True, null=False)  # Field name made lowercase.
    service_type = models.CharField(max_length=1, blank=True, null=False)
    rating = models.IntegerField(blank=True, null=True)
    verified = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=False, null=False)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')

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



class Request(models.Model):
    customer = models.ForeignKey(Customer, models.DO_NOTHING, primary_key=True)
    service_provider = models.ForeignKey('ServiceProvider', models.DO_NOTHING)
    location = models.ForeignKey(Location, models.DO_NOTHING, db_column='location')
    service_type = models.CharField(max_length=10)
    date_field = models.DateTimeField(db_column='date_', blank=True, null=True)  # Field renamed because it ended with '_'.
    rating = models.IntegerField(blank=True, null=True)
    review = models.TextField(blank=True, null=True)
    status_field = models.CharField(db_column='status_', max_length=20, blank=True, null=True)  # Field renamed because it ended with '_'.

    class Meta:
        managed = False
        db_table = 'request'
        unique_together = (('customer', 'service_provider'),)


class Req(models.Model):
    location = models.CharField(max_length=50, blank=True, null=True)
    service_type = models.IntegerField(blank=True, null=True)
    customer = models.CharField(max_length=30, blank=True, null=True)
    status = models.CharField(max_length=30, blank=True, null=False)
    start_time = models.CharField(max_length=20)
    end_time = models.CharField(max_length=20)
    sp = models.ForeignKey('ServiceProvider', models.DO_NOTHING, blank=True, null=True)



    class Meta:
        managed = False
        db_table = 'req'

    def __str__(self):
        return self.id

class check_field(models.Model):
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')
