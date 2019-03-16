from django.db import models


# Create your models here.
class Users(models.Model):
    user_email = models.CharField(primary_key=True, max_length=255)
    user_password = models.CharField(max_length=255)
    user_type = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'users'

