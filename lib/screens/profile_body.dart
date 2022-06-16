import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/common_size.dart';
import 'package:instagram/constants/screen_size.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/widgets/rounded_avatar.dart';

class ProfileBody extends StatefulWidget {

  final Function onMenuChanged;

  const ProfileBody({super.key, required this.onMenuChanged});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesMargin = 0;
  double _rightImagesMargin = size.width;
  AnimationController? _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController = AnimationController(vsync:this, duration: duration);
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(common_gap),
                          child: RoundedAvatar(
                            size:70,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right:common_gap),
                            child: Table(
                              children: [
                                TableRow(
                                    children: [
                                      _valueText('123123'),
                                      _valueText('321123'),
                                      _valueText('1223'),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      _labelText('Post'),
                                      _labelText('Followers'),
                                      _labelText('Followings'),
                                    ]
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    _username(),
                    _userBio(),
                    _editProfileBtn(),
                    _tabButtons(),
                    _selectedIndicator()
                  ]),
                ),
                _imagesPager()
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        SizedBox(
          width: 44,
        ),
        Expanded(
            child: Text(
              'Instagram',
              textAlign: TextAlign.center,
            )),
        IconButton(
          onPressed: () {
            widget.onMenuChanged();
            _iconAnimationController!.status == AnimationStatus.completed? _iconAnimationController?.reverse() : _iconAnimationController?.forward();
          },
          icon: AnimatedIcon(icon:AnimatedIcons.menu_close,progress: _iconAnimationController!,),
        )
      ],
    );
  }

  Text _valueText(String value) => Text(value,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ));


  Text _labelText(String label) => Text(label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize:11
      ));

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
        child: Stack(
      children: [
        AnimatedContainer(
          duration: duration,
          transform: Matrix4.translationValues(_leftImagesMargin, 0, 0),
          curve: Curves.fastOutSlowIn,
          child: _images(),
        ),
        AnimatedContainer(
          duration: duration,
          transform: Matrix4.translationValues(_rightImagesMargin, 0, 0),
          curve: Curves.fastOutSlowIn,
          child: _images(),
        ),
      ],
    ));
  }

  GridView _images() {
    return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1,
          children: List.generate(
            30,
            (index) => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: 'https://picsum.photos/id/${index+20}/100/100',
            ),
          ),
        );
  }

  _tabSelected(SelectedTab selectedTab){
    setState(() {
      switch(selectedTab){
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagesMargin = 0;
          _rightImagesMargin = size.width;
          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagesMargin = -size.width;
          _rightImagesMargin = 0;
          break;
      }
    });
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
        duration: duration,
        alignment: _selectedTab == SelectedTab.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          height: 3,
          width: size.width / 2,
          color: Colors.red,
        ),
        curve: Curves.fastOutSlowIn);
  }

  Row _tabButtons() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: () {
              _tabSelected(SelectedTab.left);
            },
            icon: ImageIcon(
              AssetImage('assets/images/grid.png'),
              color: _selectedTab == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              _tabSelected(SelectedTab.right);

            },
            icon: ImageIcon(
              AssetImage('assets/images/saved.png'),
              color: _selectedTab == SelectedTab.right
                  ? Colors.black26
                  : Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          child: Text(
            'Edit Profile',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: BorderSide(color: Colors.black45),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'this is what I believe!!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}

enum SelectedTab { left, right }
