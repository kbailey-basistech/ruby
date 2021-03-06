# encoding: UTF-8
require 'rosette_api'
require 'rspec'
require 'webmock/rspec'
require 'json'
WebMock.disable_net_connect!(allow_localhost: true)

describe RosetteAPI do
  RSpec.configure do |config|
      config.before(:example) { @content = 'Sample Content' }
      config.before(:example) { @json = {:content => "Sample Content"}.to_json }
  end

  describe '.get_language' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/language').
          with(:body => @json,
               :headers => {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"language\"}", :headers => {})
    end
    it 'test language' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_language(params)
      expect(response).instance_of? Hash
    end

    it 'badRequestFormat: the format of the request is invalid: multiple content sources' do
      params = DocumentParameters.new
      params.content = 'Por favor Senorita, says the man.?'
      params.content_uri = 'Por favor Senorita, says the man.?'
      expect { RosetteAPI.new('0123456789').get_language(params) }.to raise_error(BadRequestFormatError)
    end

    it 'badRequestFormat: the format of the request is invalid: no content provided;' do
      params = DocumentParameters.new
      expect { RosetteAPI.new('0123456789')
                         .get_language(params) }
                         .to raise_error(BadRequestFormatError)
    end

  end

  describe '.get_morphology_complete' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/morphology/complete').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"morphology/complete\"}", :headers => {})
    end
    it 'test morphology complete' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_morphology_complete(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_compound_components' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/morphology/compound-components').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"morphology/compound-components\"}", :headers => {})
    end
    it 'test morphology compound components' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_compound_components(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_han_readings' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/morphology/han-readings').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"morphology/han-readings\"}", :headers => {})
    end
    it 'test morphology han readings' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_han_readings(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_parts_of_speech' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/morphology/parts-of-speech').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"morphology/parts-of-speech\"}", :headers => {})
    end
    it 'test morphology parts of speech' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_parts_of_speech(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_lemmas' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/morphology/lemmas').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"morphology/lemmas\"}", :headers => {})
    end
    it 'test morphology lemmas' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_lemmas(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_entities' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/entities').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"entities\"}", :headers => {})
    end
    it 'test entities' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_entities(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_entities_no_qids' do
    before do
      no_qids_json = {:content => "Sample Content", :options => {:linkEntities => false}}.to_json
      stub_request(:post, 'https://api.rosette.com/rest/v1/entities').
          with(:body => no_qids_json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"entities\"}", :headers => {})
    end
    it 'test entities without qids' do
      params = DocumentParameters.new
      params.content = @content
      params.rosette_options = { linkEntities: false}
      response = RosetteAPI.new('0123456789').get_entities(params)
      expect(response).instance_of? Hash
    end

    it 'test rosette_options is not a Hash' do
      params = DocumentParameters.new
      params.content = 'Last month director Paul Feig announced the movie will have an all-star female cast including' \
                       ' Kristen Wiig, Melissa McCarthy, Leslie Jones and Kate McKinnon.'
      params.rosette_options = 1
      expect { RosetteAPI.new('0123456789').get_entities(params) }.to raise_error(BadRequestError)
    end
  end

  describe '.get_categories' do
    before do
      categories_json = {:contentUri => "http://google.com"}.to_json
      stub_request(:post, 'https://api.rosette.com/rest/v1/categories').
          with(:body => categories_json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"categories\"}", :headers => {})
    end
    it 'test categories' do
      params = DocumentParameters.new
      params.content_uri = "http://google.com"
      response = RosetteAPI.new('0123456789').get_categories(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_relationships' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/relationships').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"relationships\"}", :headers => {})
    end
    it 'test relationships' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_relationships(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.name_translation' do
    before do
      name_translation_json = {:name => "معمر محمد أبو منيار القذاف", :targetLanguage => "eng", :targetScript => "Latn"}.to_json
      stub_request(:post, 'https://api.rosette.com/rest/v1/name-translation').
          with(:body => name_translation_json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"name-translation\"}", :headers => {})
    end
    it 'test name translation' do
      params = NameTranslationParameters.new('معمر محمد أبو منيار القذاف'.encode('UTF-8'), 'eng')
      params.target_script = 'Latn'
      response = RosetteAPI.new('0123456789').name_translation(params)
      expect(response).instance_of? Hash
    end

    it 'badRequest: Expects NameTransaltionParameters type as an argument' do
      params = NameSimilarityParameters.new('Michael Jackson', '迈克尔·杰克逊')
      expect { RosetteAPI.new('0123456789').name_translation(params) }.to raise_error(BadRequestError)
    end
  end

  describe '.name_similarity' do
    before do
      name_similarity_json = {:name1 => "Michael Jackson", :name2 => "迈克尔·杰克逊"}.to_json
      stub_request(:post, 'https://api.rosette.com/rest/v1/name-similarity').
          with(:body => name_similarity_json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"name-similarity\"}", :headers => {})
    end
    it 'test name similarity' do
      params = NameSimilarityParameters.new('Michael Jackson', '迈克尔·杰克逊')
      response = RosetteAPI.new('0123456789').name_similarity(params)
      expect(response).instance_of? Hash
    end

    it 'badRequestFormat: name1 option can only be an instance of a String or NameParameter' do
      params = NameSimilarityParameters.new(123, 'Michael Jackson')
      expect { RosetteAPI.new('0123456789').name_similarity(params) }.to raise_error(BadRequestError)
    end

    it 'badRequestFormat: name2 option can only be an instance of a String or NameParameter' do
      params = NameSimilarityParameters.new('Michael Jackson', 123)
      expect { RosetteAPI.new('0123456789').name_similarity(params) }.to raise_error(BadRequestError)
    end

    it 'badRequest: Expects NameSimilarityParameters type as an argument' do
      params = NameTranslationParameters.new('معمر محمد أبو منيار القذاف'.encode('UTF-8'), 'eng')
      expect { RosetteAPI.new('0123456789').name_similarity(params) }.to raise_error(BadRequestError)
    end
  end

  describe '.get_tokens' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/tokens').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"tokens\"}", :headers => {})
    end
    it 'test tokens' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_tokens(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.get_sentences' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/sentences').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"sentences\"}", :headers => {})
    end
    it 'test sentences' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_sentences(params)
      expect(response).instance_of? Hash
    end
  end

  describe '.info' do
    before do
      stub_request(:get, 'https://api.rosette.com/rest/v1/info').
          with(headers: {'Accept' => '*/*',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789'}).
          to_return(:status => 200, :body => "{\"test\": \"info\"}", :headers => {})
    end
    it 'test info' do
      response = RosetteAPI.new('0123456789').info
      expect(response).instance_of? Hash
    end
  end

  describe '.ping' do
    before do
      stub_request(:get, 'https://api.rosette.com/rest/v1/ping').
          with(headers: {'Accept' => '*/*',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789'}).
          to_return(:status => 200, :body => "{\"test\": \"ping\"}", :headers => {})
    end
    it 'test ping' do
      response = RosetteAPI.new('0123456789').ping
      expect(response).instance_of? Hash
    end
  end

  describe '.get_language_custom_header' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/language').
          with(:body => @json,
               headers: {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0',
                            'X-RosetteApi-App' => 'ruby-app'}).
          to_return(:status => 200, :body => "{\"test\": \"language\"}", :headers => {})
    end

    it 'test custom_headers is invalid' do
      params = DocumentParameters.new
      params.content = 'Por favor Senorita, says the man.?'
      params.custom_headers = {"test" => "ruby-app"}
      expect { RosetteAPI.new('0123456789').get_language(params) }.to raise_error(RosetteAPIError)
    end
  end

  describe '.error_409_incompatible_client_version' do
    before do
      stub_request(:get, 'https://api.rosette.com/rest/v1/info').
          with(headers: {'Accept' => '*/*',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789'}).
          to_return(:status => 409, :body => "{\"code\": \"incompatibleClientVersion\"}", :headers => {})
    end
    it 'test error 409 properly handled' do
      expect { RosetteAPI.new('0123456789').info }.to raise_error(RosetteAPIError)
    end
  end

  describe '.get_text_embedding' do
    before do
      stub_request(:post, 'https://api.rosette.com/rest/v1/text-embedding').
          with(:body => @json,
               :headers => {'Accept' => 'application/json',
                            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                            'Content-Type' => 'application/json',
                            'User-Agent' => 'Ruby',
                            'X-Rosetteapi-Key' => '0123456789',
                            'X-Rosetteapi-Binding' => 'ruby',
                            'X-Rosetteapi-Binding-Version' => '1.3.0'}).
          to_return(:status => 200, :body => "{\"test\": \"language\"}", :headers => {})
    end
    it 'test text_embedding' do
      params = DocumentParameters.new
      params.content = @content
      response = RosetteAPI.new('0123456789').get_text_embedding(params)
      expect(response).instance_of? Hash
    end
  end


end
