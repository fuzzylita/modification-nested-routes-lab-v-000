module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist)
    if song.artist.nil?
      #in ruby this will create a select box tag
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    else
      #in ruby this will translate to a hidden tag erb
      #it will be added to params as song => {artist_id => value}
      #the value will be whatever is song.artist_id
      hidden_field_tag "song[artist_id]", song.artist_id
    end
  end
end
