import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../common.dart';

class NestedExample extends StatelessWidget {
  const NestedExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Nested Sticky Headers',
      slivers: [
        SliverStickyHeader(
          header: const Header(title: '1'),
          sliver: MultiSliver(
            children: [
              SliverStickyHeader(
                header: const Header(title: '1.1'),
                sliver: const _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: const Header(title: '1.2'),
                sliver: MultiSliver(
                  children: [
                    SliverStickyHeader(
                      header: const Header(title: '1.2.1'),
                      sliver: const _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: const Header(title: '1.2.2'),
                      sliver: const _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: const Header(title: '1.2.3'),
                      sliver: const _SliverLeaf(),
                    ),
                  ],
                ),
              ),
              SliverStickyHeader(
                header: const Header(title: '1.3'),
                sliver: const _SliverLeaf(),
              ),
            ],
          ),
        ),
        SliverStickyHeader(
          header: const Header(title: '2'),
          sliver: MultiSliver(
            children: [
              SliverStickyHeader(
                header: const Header(title: '2.1'),
                sliver: const _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: const Header(title: '2.2'),
                sliver: MultiSliver(
                  children: [
                    SliverStickyHeader(
                      header: const Header(title: '2.2.1'),
                      sliver: const _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: const Header(title: '2.2.2'),
                      sliver: const _SliverLeaf(),
                    ),
                    SliverStickyHeader(
                      header: const Header(title: '2.2.3'),
                      sliver: const _SliverLeaf(),
                    ),
                  ],
                ),
              ),
              SliverStickyHeader(
                header: const Header(title: '2.3'),
                sliver: const _SliverLeaf(),
              ),
            ],
          ),
        ),
        SliverStickyHeader(
          header: const Header(title: '3'),
          sliver: const _SliverLeaf(),
        ),
        SliverStickyHeader(
          header: const Header(title: '4'),
          sliver: MultiSliver(
            children: [
              SliverStickyHeader(
                header: const Header(title: '4.1'),
                sliver: const _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: const Header(title: '4.2'),
                sliver: const _SliverLeaf(),
              ),
              SliverStickyHeader(
                header: const Header(title: '4.3'),
                sliver: const _SliverLeaf(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverLeaf extends StatelessWidget {
  const _SliverLeaf();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        color: Colors.amber,
      ),
    );
  }
}
