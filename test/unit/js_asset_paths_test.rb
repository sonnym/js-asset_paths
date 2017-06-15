require_relative '../test_helper'

describe JsAssetPaths do
  it 'ASSET_METHOD constant has the correct values' do
    assert_equal %i(audio_path font_path image_path javascript_path stylesheet_path video_path),
      JsAssetPaths::ASSET_METHODS.sort
  end
end
