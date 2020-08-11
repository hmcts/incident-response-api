from django.apps import AppConfig
from django.conf import settings as site_settings


class CustomResponseConfig(AppConfig):
    name = "customresponse"

    def ready(self):
        from .slack import (  # noqa: F401
            event_handlers
        )

        site_settings.RESPONSE_LOGIN_REQUIRED = getattr(
            site_settings, "RESPONSE_LOGIN_REQUIRED", True
        )
