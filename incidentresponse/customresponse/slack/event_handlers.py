import logging
from urllib.parse import urljoin

from django.urls import reverse
from django.conf import settings
from response.slack.decorators import (
    slack_event,
)

logger = logging.getLogger(__name__)


@slack_event("member_joined_channel")
def handle_member_joined(incident, payload):
    user = payload["user"]
    channel = payload["channel"]
    doc_url = urljoin(
        settings.SITE_URL,
        reverse("incident_doc", kwargs={"incident_id": incident.pk}),
    )
    print("User joined channel", user)
    settings.SLACK_CLIENT.send_message(
        user,
        f":wave: I can assist you in managing this incident <#{channel}> :hugging_face: \n\n"
        f"  • Use `@Incident help` on the channel to know about everything I can assist you with.\n"
        f"  • Pin important messages in the channel, which will be added to <{doc_url}|timeline report>\n"
        f"  • Use `@Incident close` to close the incident.\n"
        f"  • Read <https://tools.hmcts.net/confluence/display/RPE/Incident+Bot+Usage+Guide|"
        f"Incident Bot Usage Guide> for detailed instructions."
    )
