# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Admin(models.Model):
    id = models.CharField(db_column='ID', max_length=30, blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(max_length=30, blank=True, null=True)
    role = models.CharField(max_length=10, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    contact_no = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'admin'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Customer(models.Model):
    id = models.CharField(db_column='ID', primary_key=True, max_length=30)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    birth_day = models.DateField(blank=True, null=True)
    image = models.CharField(max_length=100)
    contact_no = models.CharField(max_length=11)
    email = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=50)
    lat = models.FloatField()
    lon = models.FloatField()
    nid = models.IntegerField(db_column='NID', blank=True, null=True)  # Field name made lowercase.
    rating = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'customer'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class HomeChat(models.Model):
    sender = models.CharField(max_length=256)
    receiver = models.CharField(max_length=256)
    msg = models.TextField()
    time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'home_chat'


class HomeCheckField(models.Model):
    image = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'home_check_field'


class HomeChecking(models.Model):
    haha = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'home_checking'


class HomeMessagesuser(models.Model):
    sender = models.CharField(max_length=50, blank=True, null=True)
    reciever = models.CharField(max_length=50, blank=True, null=True)
    details = models.CharField(max_length=255, blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'home_messagesuser'


class Location(models.Model):
    location = models.CharField(primary_key=True, max_length=25)
    street = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'location'


class Req(models.Model):
    location = models.CharField(max_length=150, blank=True, null=True)
    lat = models.FloatField(blank=True, null=True)
    lon = models.FloatField(blank=True, null=True)
    radius = models.IntegerField(blank=True, null=True)
    service_type = models.IntegerField(blank=True, null=True)
    customer = models.CharField(max_length=30, blank=True, null=True)
    status = models.CharField(max_length=10, blank=True, null=True)
    start_time = models.CharField(max_length=20, blank=True, null=True)
    end_time = models.CharField(max_length=20, blank=True, null=True)
    sp_id = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'req'


class ServiceProvider(models.Model):
    id = models.CharField(db_column='ID', unique=True, max_length=30, blank=True, null=True)  # Field name made lowercase.
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    birth_day = models.DateField(blank=True, null=True)
    image = models.CharField(max_length=100)
    email = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    contact_no = models.CharField(max_length=11, blank=True, null=True)
    nid = models.IntegerField(db_column='NID', blank=True, null=True)  # Field name made lowercase.
    service_type = models.CharField(max_length=1, blank=True, null=True)
    rating = models.IntegerField(blank=True, null=True)
    verified = models.IntegerField(blank=True, null=True)
    password = models.CharField(max_length=30, blank=True, null=True)
    lat = models.FloatField()
    lon = models.FloatField()
    radius = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=20, blank=True, null=True, default="pending")

    class Meta:
        managed = False
        db_table = 'service_provider'


class Todo(models.Model):
    req_id = models.IntegerField()
    details = models.CharField(max_length=200, blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'todo'


class Users(models.Model):
    user_email = models.CharField(primary_key=True, max_length=255)
    user_password = models.CharField(max_length=255)
    user_type = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'users'
