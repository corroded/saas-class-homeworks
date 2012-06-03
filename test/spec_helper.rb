require 'minitest/autorun'

def load_homework_method(homework_num, homework_file_name)
  Object.class_eval do
    load(File.join(File.dirname(__FILE__), "..", "homeworks", homework_num, homework_file_name))
  end
end

def load_homework_class(homework_num, homework_file_name)
  load(File.join(File.dirname(__FILE__), "..", "homeworks", homework_num, homework_file_name))
end
