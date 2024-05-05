<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Information</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 20px;
        }
        select {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>Blood Group and Health Risks (Informational)</h1>
   <form id="userDataForm">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"><br><br>
    <label for="gender">Gender:</label>
    <select id="gender" name="gender">
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
    </select><br><br>
    <label for="bloodGroup">Blood Group:</label>
    <input type="text" id="bloodGroup" name="bloodGroup"><br><br>
    <input type="button" value="Submit" onclick="saveUserData()">
</form>

    <div id="bloodGroupInfo"></div>

   <script>
   function saveUserData() {
	    const formData = new FormData(document.getElementById("userDataForm"));
	    const userData = {};
	    formData.forEach((value, key) => {
	        userData[key] = value;
	    });

	    const jsonData = JSON.stringify(userData);

	    saveDataToFile(jsonData, 'userData.json');
	}

	function saveDataToFile(data, fileName) {
	    const blob = new Blob([data], { type: 'application/json' });
	    const url = URL.createObjectURL(blob);
	    const a = document.createElement('a');
	    a.href = url;
	    a.download = fileName;
	    document.body.appendChild(a);
	    a.click();
	    window.URL.revokeObjectURL(url);
	    document.body.removeChild(a);
	}
   </script>
</body>
</html>