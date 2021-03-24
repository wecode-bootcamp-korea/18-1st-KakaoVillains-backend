
import json, bcrypt, jwt

from my_settings    import SECRET_KEY
from account.models import User


from django.http  import JsonResponse


def authenticator (func):
    
    def wrapper(self, request, *arg, **karg):
        try: 
            token = request.headers['Authorization']

            if not token:
                return JsonResponse({"message": "Please sign in"}, status=400)

            decoded_token = jwt.decode(token, SECRET_KEY, algorithms='HS256')
            request.user  = User.objects.get(pk=decoded_token['user_id'])

            return func(self, request, *arg, **karg)
        
        except jwt.exceptions.DecodeError:
            return JsonResponse({"message": "JsonDecodeError"}, status=400)

        except User.DoesNotExist:
            return JsonResponse({"message": "Invalid token received"}, status=400)

        except KeyError:
            return JsonResponse({"message": "Token not received"}, status=400)

    
    return wrapper
    

def indicator (func):
    
    def wrapper(self, request, *arg, **karg):
        try: 
            token = request.headers.get('Authorization')

            if not token:
                request.user.id = ''
                return func(self, request, *arg, **karg)
                
            decoded_token = jwt.decode(token, SECRET_KEY, algorithms='HS256')
            request.user.id  = User.objects.get(pk=decoded_token['user_id']).id

            return func(self, request, *arg, **karg)
        
        except jwt.exceptions.DecodeError:
            return JsonResponse({"message": "JsonDecodeError"}, status=400)

        except User.DoesNotExist:
            return JsonResponse({"message": "Invalid token received"}, status=400)

        except KeyError:
            return JsonResponse({"message": "Token not received"}, status=400)

    
    return wrapper