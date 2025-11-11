package KopkeWeb;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {    
    template 'index' => { 
        'title' => 'KopkeWeb',
        'version' => "$VERSION"
    };
};

get '/about' => sub {
    template 'about' => { 
        'title' => 'KopkeWeb',
        'version' => "$VERSION"
    };
};

get '/testing123/:test' => sub {
    my $test = params->{test};
    print "$test";
    # print testing things for fun
};

true;
