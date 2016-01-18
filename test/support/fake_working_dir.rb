module FakeWorkingDirHooks
  def setup
    super
    Landrush::Server.working_dir = '/tmp/vagrant_landrush_test_working_dir'
  end

  def teardown
    super
    Landrush::Server.working_dir.rmtree if Landrush::Server.working_dir.directory?
  end
end

module MiniTest
  class Spec
    include FakeWorkingDirHooks
  end
end
