package Cx

CxPolicy[result] {
	
	# QUERY CODE
    #access to any document
    
    #access the resource object on doc

    #walk into the resource to find field encrypted

	result := {
		"documentId": "id of the sample where the vulnerability occurs",
		"searchKey": "should indicate where the breaking point occurs in the sample",
		"issueType": "pick one of the following: IncorrectValue, MissingAttribute, RedundantAttribute",
		"keyExpectedValue": "should explain the expected value",
		"keyActualValue": "should explain the actual value detected",
		"searchLine": "path where the breaking point occurs in the sample",
	}
}

concat_path(path) = concatenated {
	concatenated := concat(".", [x | x := resolve_path(path[_]); x != ""])
}


build_search_line(path, obj) = resolvedPath {
	resolveArray := [x | pathItem := path[n]; x := convert_path_item(pathItem)]
	resolvedObj := [x | objItem := obj[n]; x := convert_path_item(objItem)]
	resolvedPath = array.concat(resolveArray, resolvedObj)
}

convert_path_item(pathItem) = convertedPath {
	is_number(pathItem)
	convertedPath := sprintf("%d", [pathItem])
} else = convertedPath {
	convertedPath := sprintf("%s", [pathItem])
}

concat_path(path) = concatenated {
	concatenated := concat(".", [x | x := resolve_path(path[_]); x != ""])
}

resolve_path(pathItem) = resolved {
	options := {".", "=", "/"}
	contains(pathItem, options[_])
	resolved := sprintf("{{%s}}", [pathItem])
} else = resolved {
	is_number(pathItem)
	resolved := ""
} else = pathItem {
	true
}

