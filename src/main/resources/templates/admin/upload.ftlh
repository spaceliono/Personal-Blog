
<#include "../head.ftlh">

<head>
    <style>
        .uploadImage{
            width: 50%;
            margin: 4.5rem auto 0 auto;
        }
    </style>
</head>
<form method="POST" action="/admin/upload" enctype="multipart/form-data" class="uploadImage">
    <input type="file" name="file" /><br/><br/>
    <input type="submit" value="Submit" />
</form>