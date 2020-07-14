from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .models import *

# Create your views here.

def rating(request):
	if request.method == 'GET':
		numLikes = Rating.objects.filter(rating_type = request.GET["rating_type"],
			rating_symbol = request.GET["rating_symbol"],
			isLike = 1).count()
		numDislikes = Rating.objects.filter(rating_type = request.GET["rating_type"],
			rating_symbol = request.GET["rating_symbol"],
			isLike = 0).count()
		numUserLikes = Rating.objects.filter(rating_type = request.GET["rating_type"], 
			rating_symbol = request.GET["rating_symbol"],
			isLike = True,
			user_id = request.user.id).count()
		numUserDislikes = Rating.objects.filter(rating_type = request.GET["rating_type"], 
			rating_symbol = request.GET["rating_symbol"],
			isLike = False,
			user_id = request.user.id).count()
		return JsonResponse({"likes": numLikes, "disLikes": numDislikes, 
			"hasRatedLike": int(numUserLikes != 0),
			"hasRatedDislike": int(numUserDislikes != 0)}, safe=False)
	else:
		numRecords = Rating.objects.filter(rating_type = request.POST["rating_type"], 
			rating_symbol = request.POST["rating_symbol"],
			isLike = bool(int(request.POST["isLike"])),
			user_id = request.user.id).count()
		if numRecords == 0:
			rating = Rating(rating_type = request.POST["rating_type"], 
				rating_symbol = request.POST["rating_symbol"],
				isLike = bool(int(request.POST["isLike"])),
				user_id = request.user.id)
			rating.save()
			return JsonResponse({"result": 1}, safe=False)
		else:
			Rating.objects.filter(rating_type = request.POST["rating_type"], 
			rating_symbol = request.POST["rating_symbol"],
			isLike = bool(int(request.POST["isLike"])),
			user_id = request.user.id).delete()
			return JsonResponse({"result": -1}, safe=False)