requires "Code::TidyAll::Plugin" => "0";
requires "Moo" => "0";
requires "Sort::Naturally" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'build' => sub {
  requires "Module::Build" => "0.28";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "Module::Build" => "0.28";
};

on 'develop' => sub {
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Test::CPAN::Changes" => "0.19";
  requires "Test::Pod::Coverage" => "1.08";
  requires "Test::Spelling" => "0.12";
};
