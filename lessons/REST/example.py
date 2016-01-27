#!/usr/bin/python
import requests	# For sending HTTP requests
import json	# For parsing JSON
import sys	# For command line parameters

def main(argv):
	url = "http://services.groupkt.com/country/get/iso2code/" + argv[0]
	r = requests.get(url)

	if r.ok:
		data = json.loads(r.content)
		print data['RestResponse']['result']['name']
	else:
		print "Failed."

if __name__ == "__main__":
	main(sys.argv[1:])
