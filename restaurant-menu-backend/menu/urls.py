from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import MenuItemViewSet

# Create a router and register the MenuItemViewSet with it
router = DefaultRouter()
router.register(r'menu-items', MenuItemViewSet)

# The router will automatically create routes for CRUD operations
urlpatterns = [
    path('api/', include(router.urls)),  # Automatically includes routes for menu-items
]
