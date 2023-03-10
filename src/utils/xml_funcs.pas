
Unit xml_funcs;

{$mode ObjFPC}{$H+}

Interface

Uses 
DOM, XMLWrite, XMLRead, data_types,
Classes, SysUtils;

Procedure addXmlDataNode(Var _settings: TXMLDocument; Var root: TDOMNode;
                            setting, Data: String);

Procedure addXmlArrayNode(Var _settings: TXMLDocument; Var root_array: TDOMNode;
                             node_name, attribute, Data, content: String);

Function get_node_content(settings: TXMLDocument; node: String):   string;
Function getRecentNotes(settings: TXMLDocument):   arRecentNotes;

Implementation

Procedure addXmlDataNode(Var _settings: TXMLDocument; Var root: TDOMNode;
                            setting, Data: String);

Var 
    settings_node, data_node:   TDOMNode;
Begin
    settings_node := _settings.CreateElement(setting);
    root.Appendchild(settings_node);

    data_node := _settings.CreateTextNode(Data);
    settings_node.Appendchild(data_node);
End;

Procedure addXmlArrayNode(Var _settings: TXMLDocument; Var root_array: TDOMNode;
                             node_name, attribute, Data, content: String);

Var 
    array_node, data_node:   TDOMNode;
Begin
    array_node := _settings.CreateElement(node_name);
    TDOMElement(array_node).SetAttribute(attribute, Data);
    root_array.AppendChild(array_node);

    data_node := _settings.CreateTextNode(content);
    array_node.AppendChild(data_node);
End;

Function get_node_content(settings: TXMLDocument; node: String):   string;

Var 
    node_:   TDOMNode;
Begin
    node_ := settings.DocumentElement.FindNode(node);
    Result := node_.TextContent;
End;

Function getRecentNotes(settings: TXMLDocument):   arRecentNotes;

Var 
    nodes:   TDOMNode;
    node, data_node:   TDOMNode;

    i:   integer;

    recent_notes:   arRecentNotes;
    rn_count:   integer;
Begin
    rn_count := 0;
    SetLength(recent_notes, rn_count);

    nodes := settings.DocumentElement.FindNode('recent_notes');
    While Assigned(nodes) Do
        Begin
            With nodes.ChildNodes Do
                Try
                    For i := 0 To (Count - 1) Do
                        Begin
                            rn_count := rn_count + 1;
                            SetLength(recent_notes, rn_count);

                            recent_notes[rn_count - 1].collection := 
                                                                     Item[i].Attributes.Item[0].
                                                                     NodeValue;
                            recent_notes[rn_count - 1].id := Item[i].TextContent;
                        End;
                Finally
                    Free;
        End;
    nodes := nodes.NextSibling;
End;

Result := recent_notes;
End;

End.
