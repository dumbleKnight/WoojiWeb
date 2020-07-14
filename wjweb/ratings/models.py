from django.db import models
import uuid

# Create your models here.

class Rating(models.Model):
	rating_type = models.CharField(max_length=20, help_text='Type of rating')
	rating_symbol = models.CharField(max_length=20, help_text='identifier of the specific rating object')
	id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
	user_id = models.IntegerField() 
	isLike = models.BooleanField()

	def __str__(self):
		return self.rating_type + ":" + self.rating_symbol
