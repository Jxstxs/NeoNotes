
Unit file_funcs;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, data_types,
DOM, XMLWrite, XMLRead, xml_funcs, db_manager;

Procedure checkDataDir();
Procedure loadSettingsFromFile();
Procedure createCollection(title, author: String);

Function checkCollectionExists(collection: String):   boolean;
Function checkNoteExists(note: String):   boolean;

Implementation

Procedure checkDataDir();

Var 
    usr_home:   string;
    settings_path:   string;

    settings:   TXMLDocument;
    root_node:   TDOMNode;
    array_node:   TDOMNode;
Begin
    // Getting the Home Directory of the User
    usr_home := GetUserDir;
    If (usr_home = '') Then
        Begin
            writeln('ERROR: Cant get User Home');
            exit;
        End;

    nnConfig.dataPath := usr_home + '.SchoolNotes';
    // Check if a SchoolNotes Directory already exists
    If (Not DirectoryExists(nnConfig.dataPath)) Then
        Begin
            CreateDir(nnConfig.dataPath);
        End;

    settings_path := nnConfig.dataPath + nnConfig.pathDelim + 'settings.xml';
    // Check if a Configuration file exists
    If (Not FileExists(settings_path)) Then
        Begin
            Try
                // Creating the XML Configuration file
                settings := TXMLDocument.Create;
                root_node := settings.CreateElement('settings');
                settings.Appendchild(root_node);

                addXmlDataNode(settings, root_node, 'open_recent', 'false');

                array_node := settings.CreateElement('recent_notes');
                root_node.Appendchild(array_node);

                // Write the File to Disk
                writeXMLFile(settings, settings_path);
            Finally
                settings.Free;
        End;
End;
End;


Procedure loadSettingsFromFile();

Var 
    settings:   TXMLDocument;

    settings_path:   string;
Begin
    Try
        // Read the Settings File
        settings_path := nnConfig.dataPath + nnConfig.pathDelim + 'settings.xml';
        ReadXMLFile(settings, settings_path);

        // Reading in the Settings
        nnConfig.openRecent := StrToBool(get_node_content(settings, 'open_recent'));
        nnConfig.recentNotes := getRecentNotes(settings);

    Finally
        settings.Free;
End;
End;

Function checkCollectionExists(collection: String):   boolean;

Var 
    collection_path:   string;
Begin
    collection_path := nnConfig.data_path + nnConfig.os_path_delim + collection;
    Result := DirectoryExists(collection_path);
End;

Function checkNoteExists(note: String):   boolean;

Var 
    note_path:   string;
Begin
    note_path := nnConfig.data_path + nnConfig.os_path_delim +
                 nnConfig.current_collection + nnConfig.os_path_delim + note;
    Result := FileExists(note_path);
End;

Procedure createCollection(title, author: String);
var
    collection_path: String;
Begin
    collection_path := nnConfig.data_path + nnConfig.os_path_delim + title;
    CreateDir(collection_path);

    if (nnConfig.db_already_setup <> True) then setup_database();
    // NOTE: hier gehts weiter
End;

End.