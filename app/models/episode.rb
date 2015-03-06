class Episode < ActiveRecord::Base
  belongs_to :feed
  has_attached_file :mp3, {
    # Choose the FTP storage backend
    :storage => :ftp,

    :path => "/:filename",

    # The full URL of where the attachment is publicly accessible.
    # This supports Paperclip::Interpolations.
    :url => "/:filename",

    # The list of FTP servers to use
    :ftp_servers => [
      {
        :host     => "ftp.codeandcountry.com",
        :user     => "test@flashharris.com",
        :password => "uploadtest"
      }
    ],

    # Optional socket connect timeout (in seconds).
    # This only limits the connection phase, once connected
    # this option is of no more use.
    :ftp_connect_timeout => 5, # optional, nil by default (OS default timeout)

    # Optional flag to skip dead servers.
    # If set to true and the connection to a particular server cannot be
    # established, the connection error will be ignored and the files will
    # not be uploaded to that server.
    # If set to false and the connection to a particular server cannot be established,
    # a SystemCallError will be raised (Errno::ETIMEDOUT, Errno::ENETUNREACH, etc.).
    :ftp_ignore_failing_connections => true # optional, false by default
  }

  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", "image/png"] } 

  def url
    if feed.uses_podtrac
      "http://www.podtrac.com/pts/redirect.mp3/#{read_attribute(:url)}"
    else
      read_attribute(:url)
    end
  end
end
