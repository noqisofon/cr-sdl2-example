require "sdl2"

begin
  answer = LibSDL2.init( LibSDL2::INIT_EVERYTHING )

  p answer

  # 描画する窓を作成します。
  window   = LibSDL2.create_window( "Example SDL2", 0, 0, 640, 400, LibSDL2::WindowFlags::WINDOW_OPENGL )

  # 窓への描画に使用するレンダラーを作成します。
  renderer = LibSDL2.create_renderer( window, -1, LibSDL2::RendererFlags::ACCELERATED )

  # 描画色を選択します。今回は赤を設定します。
  LibSDL2.set_render_draw_color( renderer, 255, 0, 0, 255 )

  # 選択した色で画面を消去します。
  LibSDL2.render_clear( renderer )

  # 上記の描画はすべて裏側で行われているため、
  # これで表示され、窓が赤くなります。
  LibSDL2.render_present( renderer )

  # 窓を見せるため、5 秒待ちます。
  LibSDL2.delay( 5000 )
  
ensure
  LibSDL2.destroy_window( window ) if window
  LibSDL2.destroy_renderer( renderer ) if renderer

  LibSDL2.quit()
end
