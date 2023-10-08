from python_terraform import *
import time
import requests
import os

from dotenv import load_dotenv
load_dotenv()

def cerate():
    terraform = Terraform(working_dir=".")
    return_code, stdout, stderr = terraform.apply(
        capture_output=True, skip_plan=True, auto_approve=IsFlagged
    )
    return return_code, stdout, stderr


def messageMeOnDiscord(success: bool) -> None:
    messageId = os.getenv('messageid')
    webhookurl = os.getenv('webhookurl')
    url = f"{webhookurl}/messages/{messageId}"
    numTries = requests.get(url).json()["embeds"][0]["fields"][1]["value"]
    numTries = int(numTries) + 1 if numTries else 1
    embed = {
        "title": "Terraform",
        "description": "Terraform has been run",
        "color": 5763719 if success else 15548997,
        "fields": [
            {"name": "Status", "value": "Success" if success else "Failure"},
            {"name": "Number of Tries", "value": numTries},
            {"name": "Time", "value": time.strftime("%H:%M:%S", time.localtime())}
        ],
    }
    requests.patch(url, json={"embeds": [embed]})


if __name__ == "__main__":
    print("Starting...")
    triesSinceStart = 0
    while True:
        triesSinceStart += 1
        return_code, stdout, stderr = cerate()
        if stderr:
            messageMeOnDiscord(False)
            print(f"Failed after {triesSinceStart} tries since starting this script!")
        else:
            messageMeOnDiscord(True)
            print("Success!")
            break
        time.sleep(300)
