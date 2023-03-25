# This is a PowerShell script that will open up Jupyter notebook using
# the single read-only virtual.
#
# This should work on the faculty machines 'dryadaXX' and possibly on other.
# This might also work on students' machines.

function ActivateVirtual() {
	py -m venv env
	.\env\scripts\activate.ps1
}

function InstallRequirements() {
	pip install --upgrade pip
	pip install wheel
	pip install --requirement .\requirements.txt
}

function Main() {
	try {
		$at_fi = [System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain().Name
	} catch {
		$at_fi = ""
	}
	if ($at_fi.Equals("ad.fi.muni.cz")) {
		# activate the virtual environment
		i:\pv080\seminars\venv\scripts\activate.ps1
	} else {
		ActivateVirtual
		InstallRequirements
	}
}

Main
