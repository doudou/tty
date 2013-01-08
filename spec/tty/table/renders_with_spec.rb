# -*- encoding: utf-8 -*-

require 'spec_helper'

describe TTY::Table, '#renders_with' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows) { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table) { described_class.new header, rows }

  let(:border_class) {
    class MyBorder < TTY::Table::Border
      def_border do
        {
          'top'          => '=',
          'top_mid'      => '*',
          'top_left'     => '*',
          'top_right'    => '*',
          'bottom'       => '=',
          'bottom_mid'   => '*',
          'bottom_left'  => '*',
          'bottom_right' => '*',
          'mid'          => '=',
          'mid_mid'      => '*',
          'mid_left'     => '*',
          'mid_right'    => '*',
          'left'         => '$',
          'right'        => '$'
        }
      end
    end
  }

  it 'displays custom border' do
    border_class
    table.renders_with MyBorder
    table.to_s.should == <<-EOS.normalize
      *==*==*==*
      $h1$h2$h3$
      *==*==*==*
      $a1$a2$a3$
      $b1$b2$b3$
      *==*==*==*
    EOS
  end

end # renders_with