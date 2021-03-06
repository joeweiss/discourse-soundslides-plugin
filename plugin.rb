#!/bin/env ruby
# encoding: utf-8
# name: soundslides.com Onebox
# version: 0.3
# authors: joeweiss


register_css <<CSS
.embed-container {
  position: relative;
  padding-bottom: 66.63%;
  height: 0;
  overflow: hidden;
  max-width: 100%;
}
.embed-container iframe, .embed-container object, .embed-container embed {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
CSS


Onebox = Onebox
class Onebox::Engine::SoundslidesOnebox
    include Onebox::Engine

    def self.priority
        0
    end

    REGEX = /^https?:\/\/play\.soundslides\.[orgcom]+\/([0-9a-zA-Z\-]+)?(\/|\/fill\/?\/?)?$/

    matches_regexp REGEX

    def id
        @url.match(REGEX)[1]
    end

    def url
        "https://play.soundslides.org/#{id}"
    end

    def to_html
        <<HTML
        <div class='embed-container'>
          <iframe src="https://play.soundslides.org/#{id}/fill" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen /></iframe>
        </div>
HTML
    end
end
