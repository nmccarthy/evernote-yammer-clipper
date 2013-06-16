class PagesController < ApplicationController

def login
end

def home
end

def add_note
  # note_store_url = "http://sandbox.evernote.com/edam/note/#{current_user.evernote_shard_id}"
  # note_store_transport = Thrift::HTTPClientTransport.new(note_store_url)
  # note_store_protocol = Thrift::BinaryProtocol.new(note_store_transport)
  # note_store = Evernote::EDAM::NoteStore::NoteStore::Client.new(note_store_transport)

  note_store_url = "http://sandbox.evernote.com/edam/note/#{current_user.evernote_shard_id}"
  note_store = Evernote::NoteStore.new(note_store_url)

  # notebooks = note_store.listNotebooks(current_user.evernote_token)
  # raise notebooks.to_yaml

  note = Evernote::EDAM::Type::Note.new()
  note.title = "Hello Neil"
  note.content = '<?xml version="1.0" encoding="UTF-8"?>' +
    '<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">' +
    '<en-note>Hello, world!</en-note>'
  
  # raise note.to_yaml
  
  note_response = note_store.createNote(current_user.evernote_token, note)
  redirect_to "/"
end

end
