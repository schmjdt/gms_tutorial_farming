/// @description Wrap Text

name		   = names[page];
voice		   = voices[page];
portrait_index = portraits[page];

text_wrapped = string_wrap(text[page], text_max_width);
str_len = string_length(text_wrapped);
counter = 0;