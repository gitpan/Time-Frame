use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# # the contents of the Makefile that is written.
WriteMakefile(
  'NAME'         => 'Time::Frame',
  'VERSION_FROM' => 'Frame.pm', # finds $VERSION
  'dist'         => { 'COMPRESS' => 'gzip', 'SUFFIX' => 'tgz' },
);