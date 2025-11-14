"""
Geolocate talks
===============
"""

import glob
from dataclasses import dataclass
from datetime import datetime

import pgeocode
import getorg


URL = "https://andrewfowlie.github.io/talk/"
OUTPUT = "static/talkmap"
TALKS = glob.glob("content/talk/*/index.md")
MISSING = {"TW": {"Taipei": (25.04776, 121.53185),
                  "Hualien": (23.97694, 121.60444)}}


pgeocode.COUNTRIES_VALID += ["CN"]


@dataclass
class Location:
    latitude: float
    longitude: float


def format_date(date):
    date_obj = datetime.strptime(date, "%Y-%m-%d")
    return date_obj.strftime("%-d %B %Y")


def locate(place_name, country_code):
    try:
        return Location(*MISSING[country_code][place_name])
    except KeyError:
        pass

    geodata = pgeocode.Nominatim(country_code)._data
    match = geodata[geodata["place_name"] == place_name]
    if match.size == 0:
        return None
    return Location(match.iloc[0]["latitude"], match.iloc[0]["longitude"])


def from_markdown(file_name, key):
    with open(file_name, 'r') as f:
        for line in f.readlines():
            if line.startswith(f"{key} ="):
                return line.split("=")[1].strip().strip('"')


def make_html_map(location_dict):
    # m = getorg.orgmap.create_map_obj()
    getorg.orgmap.output_html_cluster_map(
        location_dict, folder_name=OUTPUT, hashed_usernames=False)


def make_url(file_name):
    page = file_name.split("/")[-2]
    return f"{URL}/{page}"


if __name__ == "__main__":

    location_dict = {}

    for file_name in TALKS:

        title = from_markdown(file_name, "title")
        location = from_markdown(file_name, "location")
        event = from_markdown(file_name, "event")
        date = format_date(from_markdown(file_name, "date"))
        place_name = from_markdown(file_name, "place_name")
        country_code = from_markdown(file_name, "country_code")
        url = make_url(file_name)

        if not country_code or not place_name:
            print(f"no data for {file_name} at {location}")
            continue

        if event:
            description = f"<a href='{url}'><em>{title}</em></a><br>{event}<br>{location}<br>{date}"
        else:
            description = f"<a href='{url}'><em>{title}</em></a><br>{location}<br>{date}"

        try:
            location_dict[description] = locate(place_name, country_code)
        except:
            print(
                f"no match for {file_name} at {location} at {place_name}, {country_code}")

        make_html_map(location_dict)
