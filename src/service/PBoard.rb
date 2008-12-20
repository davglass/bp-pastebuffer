require('Pathname')


class PBPaste

    def initialize(args)
        @dir = args['service_dir']

    end

    def _getImage()
        return `osascript "#{@dir}/ascript.scpt"`.chomp
    end

    def get(bp, args)
        file = _getImage()
        if file == ''
            file = false
        else
            file = Pathname.new(file)
        end
        if args['callback']
            @callback = args['callback']
            args['callback'].invoke(file)
        end
        bp.complete(file)
    end


end


rubyCoreletDefinition = {
  'class' => "PBPaste",
  'name'  => "PBPaste",
  'major_version' => 0,
  'minor_version' => 0,
  'micro_version' => 1,
  'documentation' => 
    'This plugin grabs an image from your clipboard and returns it to the browser',

  'functions' =>
  [
    {
      'name' => 'get',
      'documentation' => "Gets the image that in the clipboard.",
      'arguments' =>
      [
          {
            'name' => 'callback',
            'type' => 'callback',
            'required' => false,
            'documentation' => 'the callback to send a hello message to'
          }
      ]
    }
  ] 
  }
