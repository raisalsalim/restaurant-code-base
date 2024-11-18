from django.contrib import admin
from django.urls import path, include  # Corrected the import
from rest_framework.routers import DefaultRouter
from menu.views import MenuItemViewSet

# Create a router and register our viewset with it
router = DefaultRouter()
router.register(r'menu-items', MenuItemViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),  # Register the API routes
]
