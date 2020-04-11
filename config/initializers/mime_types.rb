# frozen_string_literal: true

json_synonyms = Mime::Type.lookup('application/json')
                          .send(:synonyms)
                          .push('application/vnd.api+json')

Mime::Type.register 'application/json', :json, json_synonyms
