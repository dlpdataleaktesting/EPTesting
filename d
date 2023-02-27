
import requests
from bs4 import BeautifulSoup

# Set the URL of the website you want to check
url = "https://www.example.com"

# Send a GET request to the website and fetch its HTML content
response = requests.get(url)
html_content = response.content

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(html_content, "html.parser")

# Check if the website's content has changed
if html_content != previous_html_content:
    print("The website has been updated!")
    # TODO: Do something when the website has been updated
else:
    print("The website has not been updated.")
