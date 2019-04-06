from django.db import models




class Admin(models.Model):
    id = models.CharField(max_length=30, blank=True, null=False, primary_key=True)  # Field name made lowercase.
    password = models.CharField(max_length=30, blank=True, null=True)
    role = models.CharField(max_length=10, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    contact_no = models.CharField(max_length=10, blank=True, null=True)
    class Meta:
        db_table = 'admin'

class Customer(models.Model):
    id = models.CharField(primary_key=True, max_length=30)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50, blank=True, null=True)
    contact_no = models.CharField(max_length=11, blank=False, null=True)
    city = models.CharField(max_length=50)
    nid = models.IntegerField(db_column='NID', blank=True, null=True)  # Field name made lowercase.
    rating = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=False, null=False)
    image = models.ImageField(upload_to="profile_image", blank=True)

    class Meta:
        db_table = 'users'

class ServiceProvider(models.Model):
    id = models.CharField(unique=True, max_length=30, blank=False, null=False, primary_key=True)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    contact_no = models.CharField(max_length=11, blank=True, null=True)
    nid = models.IntegerField(db_column='NID', blank=True, null=True)  # Field name made lowercase.
    service_type = models.CharField(max_length=1, blank=True, null=True)
    rating = models.IntegerField(blank=True, null=True)
    verified = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=False, null=False)
    image = models.ImageField(upload_to="profile_image", blank=True)

    class Meta:
        db_table = 'service_provider'
