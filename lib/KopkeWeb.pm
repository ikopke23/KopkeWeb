package KopkeWeb;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'KopkeWeb' };
};

get '/about' => sub {
    template 'about' => { 'title' => 'KopkeWeb' };
};

true;
