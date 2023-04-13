// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MimoFrenzyNFT.sol";

contract MimoFrenzyNFTTest is Test {
    MimoFrenzyNFT public token;

    address internal alice;
    address internal bob;
    address internal mike;
    address internal dog;
    address internal cat;
    address internal pig;
    address internal admin;

    function setUp() public {
        alice = 0x0000001Cc0d120Df09c2CD2f24681B96d1Ddfd64;
        bob = 0xf0E14a0A671c306ED63C912506926860e2E41c8C;
        mike = 0xf10DDE91cA3A1713Cd3EBEE7Ea1fc1B685763999;
        dog = 0xf21afE8a9314B954fFCEAD885bF94eAd74252CB1;
        cat = 0xf23ae3767363a025A6c9a3E6D382875a16f37063;
        pig = 0xf268D98749674eE8523de9996984af7353a615f0;
        admin = vm.addr(0x1);
        vm.deal(alice, 100 ether);
        vm.deal(bob, 100 ether);
        vm.deal(mike, 100 ether);
        vm.deal(dog, 100 ether);
        vm.deal(cat, 100 ether);
        vm.deal(pig, 100 ether);

        token = new MimoFrenzyNFT(
            0x9c6fe5972dcb001809d4eabfd9fca128cf8f2a58fee9ff8508f3b4475071a472,
            "",
            5
        );
    }

    function testAllFreeMinted() public {
        bytes32[] memory proof = new bytes32[](12);
        proof[0] = 0xb44af026805577ee3499393e8c67f3b6171c2ca1890c62d5704abd964e73cf1b;
        proof[1] = 0xcdaf3d0873a4b4c92cd646f2eaf920bdce7c9e07a77e4bfb2d8abda1e1a37e57;
        proof[2] = 0x87a408efd00a92ca31cc5a4c59cffef04e996b15cef170bf7455492f149b6fdb;
        proof[3] = 0x4f5a7ade6c94b4cb4b4637085856ce570672ee1c7c6c00a0949957949d10aca7;
        proof[4] = 0xe4caba460253f74c62fc6f7592db32d39e508699d1f4fe9a829e935b61a428c8;
        proof[5] = 0xe979986abfa02a732157df4ccdf704c73ebddc14b3f70e45c38ad3a3e4721004;
        proof[6] = 0xf0135a98653ac349c3fdf1b1066580098a6f1b384e7c3892491edd0f8987bf6b;
        proof[7] = 0x65008f026cb016875c9d919cce64e4d26d7b78825d872b753b1a5771d9589383;
        proof[8] = 0xcce28cd1e722112c62ee56e15c94d8e6210edfd9029df5568196031ed67073dd;
        proof[9] = 0xe92f0f35c01764c676380750ee33cd5b2014b2d87472863f5ff4a60be39f1877;
        proof[10] = 0xaf82e91879e7230b0c6a0f21bd03f1012030a3b3ac09bea86372f9d30664733a;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        vm.prank(alice);
        token.claim(0, alice, proof);
        assertEq(1, token.balanceOf(alice));

        proof[0] = 0x33cbd54a90f74462793d081fd0fb9c9a91ac9aa2d52fdf525aace0ccb1909f4c;
        proof[1] = 0x3b149d3f0e901d490acdf0e096099de1ecb9811d261b0c4d3ef00c9c12795252;
        proof[2] = 0x723b79c88123cd8a2fa8ba686f62ac18490bd7a9020d34ef5aa8861eabff4780;
        proof[3] = 0x48f0a5c2a8b18daf9082c0b474b5ba55b659494edfd57ad5d8e8e48fdd253ae7;
        proof[4] = 0x928892a5a2945c654bde30860addd60198f7670513fde9938fdc1c2273125d14;
        proof[5] = 0xc6ccdb864bb63a92119a72e135f50a37b896f989bc6ad0ecdb8e0e3040e69d8e;
        proof[6] = 0x11870c4c26fe3d415fbc281e47b62062b8f0b424bc6db19d4f60b1563eb9f0f7;
        proof[7] = 0x75f389e0bcbf1bbe348a5300dca45665a6efe9742cfb9596e5412f28bd122d3a;
        proof[8] = 0x1ff729f1ef7238d5dd1ba1ce88509a16b6072adc803d9ea58a5e72a0220e6d76;
        proof[9] = 0x4513d6481bb1d98e2b15cefbe8c44cde44af31c2ac4c3306cd675b56f4d5ec31;
        proof[10] = 0x9879cff66dfe9b377ae2f18bd45f575177df41b1e2782987ea246338bcafe03f;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        token.claim(2303, bob, proof);
        assertEq(1, token.balanceOf(bob));

        proof[0] = 0xcf0ffa045e5a8c51b1a0258fcfea345066b7c5e5aff8f87be9c0196c37b0e5ea;
        proof[1] = 0xf800a62361c441e17c35ef8c0332b84b7baf50da605a32920f706c852943f613;
        proof[2] = 0x6e2661244ddde5bf8db0d586fa82e943c6165bf090e09d7a47be246ed5299481;
        proof[3] = 0x0ea60c0f1815253be9fde6f208af638b5d547541af782aa5dc5d2bb40a35197f;
        proof[4] = 0x9f79cf58c20f692536b670f62e68dc900c4e8cb76ef44c7503b66b72fee5fcd9;
        proof[5] = 0xb84095b58ed21af9b43bd978307477e0ab8323a723dcfe71e781f2e8aa52e40c;
        proof[6] = 0x63e912c6479207f438c541744e8fa05b792f538d0b6049b983f1b37b3ce12869;
        proof[7] = 0x4219464179c99fe6f6370c6de3530187660f4bd3ce38632461ddcd4770abe818;
        proof[8] = 0x44ee81ed5d048728ef14033b4eac79c8e4a8a918a8c0c875bc81acff538b58f3;
        proof[9] = 0xe92f0f35c01764c676380750ee33cd5b2014b2d87472863f5ff4a60be39f1877;
        proof[10] = 0xaf82e91879e7230b0c6a0f21bd03f1012030a3b3ac09bea86372f9d30664733a;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        token.claim(2304, mike, proof);
        assertEq(1, token.balanceOf(mike));

        proof = new bytes32[](10);
        proof[0] = 0xe9c34aaf46d8c1ed7fab442d388747ceb159a3916d4cf0b30c6c97c70e28b4b9;
        proof[1] = 0x4567051aeb42768f6b19f48a3486ab8ab0e8f37589a2e2426ba2ec53d044f1b8;
        proof[2] = 0xec1c25f4b0262977b42956c7992e920d1a910558a5560cb979121da2d515443f;
        proof[3] = 0xb4681afacdbdedac61a8f6c574ac30a701cc22078d6ff5c751c2f3416092097a;
        proof[4] = 0xd1dfe483466f2dadb5c6c24c9451a85221de3f890c1a5a028b868894b377e9b4;
        proof[5] = 0xb99ef08595a29bee64285c36a86783bd3e10b7079d917bf125cec28da0631c4c;
        proof[6] = 0x6175eebe6a4aa0c8a3fa230098d205cdac71099269263a983815578dd15bdc6b;
        proof[7] = 0xef47a269eebad8c38313529b6cc19c82406cb13634479c0db0a9eaa1f5488ba4;
        proof[8] = 0xbffcfa6c6322e4b9d371e780aea38058b245cb43578e2741d2bfdd793ede37d5;
        proof[9] = 0xef81723ab9653806b48fbd7e5450eb76c8f27af1279e92ec665ca6a13413b77f;
        token.claim(2310, dog, proof);
        assertEq(1, token.balanceOf(dog));

        proof[0] = 0xf6bfaf03c1d77db99c2364c73a172473f72a7069ef718fa9ebf72297a0a315e5;
        proof[1] = 0x744473272bc31e68a873a806db85850491c42004c7c161ad4ae2390f3f05d56f;
        proof[2] = 0x1a2425998fccc28153d12b0f7c878f34306f21dae0620b7ae6c9f6d5d88c7bc7;
        proof[3] = 0xba4b49a98928dcc63ebbb9a4b67cdf85398487e52bdb23b3244ddcced7bda710;
        proof[4] = 0x92443d4ce917d6794d51a5319ee7394df051165df305e4fa99bbdc63effb2376;
        proof[5] = 0x56531b96d73ce19f839968fed62d837ead0b2ae719970e4c1a58db8bc13ab7ef;
        proof[6] = 0xaae8f975c399bf5a4cf0dd1ff2970d2a8593ed1e9c2379cac7f608811ef9a23f;
        proof[7] = 0xbdd1370d58dd8631b80347bc9ebe318d26062e9fa8c12216ab7f3256f7bd1efd;
        proof[8] = 0xbffcfa6c6322e4b9d371e780aea38058b245cb43578e2741d2bfdd793ede37d5;
        proof[9] = 0xef81723ab9653806b48fbd7e5450eb76c8f27af1279e92ec665ca6a13413b77f;
        token.claim(2311, cat, proof);
        assertEq(1, token.balanceOf(cat));

        vm.expectRevert("MimoFrenzyNFT: Mint closed.");
        token.claim(2312, pig, proof);
        assertEq(0, token.balanceOf(pig));
    }

    function testFreeMintAndPaidMint() public {
        bytes32[] memory proof = new bytes32[](12);
        proof[0] = 0xb44af026805577ee3499393e8c67f3b6171c2ca1890c62d5704abd964e73cf1b;
        proof[1] = 0xcdaf3d0873a4b4c92cd646f2eaf920bdce7c9e07a77e4bfb2d8abda1e1a37e57;
        proof[2] = 0x87a408efd00a92ca31cc5a4c59cffef04e996b15cef170bf7455492f149b6fdb;
        proof[3] = 0x4f5a7ade6c94b4cb4b4637085856ce570672ee1c7c6c00a0949957949d10aca7;
        proof[4] = 0xe4caba460253f74c62fc6f7592db32d39e508699d1f4fe9a829e935b61a428c8;
        proof[5] = 0xe979986abfa02a732157df4ccdf704c73ebddc14b3f70e45c38ad3a3e4721004;
        proof[6] = 0xf0135a98653ac349c3fdf1b1066580098a6f1b384e7c3892491edd0f8987bf6b;
        proof[7] = 0x65008f026cb016875c9d919cce64e4d26d7b78825d872b753b1a5771d9589383;
        proof[8] = 0xcce28cd1e722112c62ee56e15c94d8e6210edfd9029df5568196031ed67073dd;
        proof[9] = 0xe92f0f35c01764c676380750ee33cd5b2014b2d87472863f5ff4a60be39f1877;
        proof[10] = 0xaf82e91879e7230b0c6a0f21bd03f1012030a3b3ac09bea86372f9d30664733a;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        vm.prank(alice);
        token.claim(0, alice, proof);
        assertEq(1, token.balanceOf(alice));

        token.stopFreeMint();
        proof[0] = 0x33cbd54a90f74462793d081fd0fb9c9a91ac9aa2d52fdf525aace0ccb1909f4c;
        proof[1] = 0x3b149d3f0e901d490acdf0e096099de1ecb9811d261b0c4d3ef00c9c12795252;
        proof[2] = 0x723b79c88123cd8a2fa8ba686f62ac18490bd7a9020d34ef5aa8861eabff4780;
        proof[3] = 0x48f0a5c2a8b18daf9082c0b474b5ba55b659494edfd57ad5d8e8e48fdd253ae7;
        proof[4] = 0x928892a5a2945c654bde30860addd60198f7670513fde9938fdc1c2273125d14;
        proof[5] = 0xc6ccdb864bb63a92119a72e135f50a37b896f989bc6ad0ecdb8e0e3040e69d8e;
        proof[6] = 0x11870c4c26fe3d415fbc281e47b62062b8f0b424bc6db19d4f60b1563eb9f0f7;
        proof[7] = 0x75f389e0bcbf1bbe348a5300dca45665a6efe9742cfb9596e5412f28bd122d3a;
        proof[8] = 0x1ff729f1ef7238d5dd1ba1ce88509a16b6072adc803d9ea58a5e72a0220e6d76;
        proof[9] = 0x4513d6481bb1d98e2b15cefbe8c44cde44af31c2ac4c3306cd675b56f4d5ec31;
        proof[10] = 0x9879cff66dfe9b377ae2f18bd45f575177df41b1e2782987ea246338bcafe03f;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        vm.expectRevert("MimoFrenzyNFT: Mint closed.");
        token.claim(2303, bob, proof);
        assertEq(0, token.balanceOf(bob));

        vm.prank(bob);
        vm.expectRevert("MimoFrenzyNFT: Too low mint fee.");
        token.mint{value: 90 ether}();
        assertEq(0, token.balanceOf(bob));

        vm.prank(bob);
        token.mint{value: 99 ether}();
        assertEq(1, token.balanceOf(bob));

        vm.prank(mike);
        token.mint{value: 99 ether}();
        assertEq(1, token.balanceOf(mike));

        vm.prank(dog);
        token.mint{value: 99 ether}();
        assertEq(1, token.balanceOf(dog));

        vm.prank(cat);
        token.mint{value: 99 ether}();
        assertEq(1, token.balanceOf(cat));

        vm.prank(pig);
        vm.expectRevert("MimoFrenzyNFT: Mint closed.");
        token.mint{value: 99 ether}();
        assertEq(0, token.balanceOf(pig));
    }

    function testEarlyCloseMint() public {
        bytes32[] memory proof = new bytes32[](12);
        proof[0] = 0xb44af026805577ee3499393e8c67f3b6171c2ca1890c62d5704abd964e73cf1b;
        proof[1] = 0xcdaf3d0873a4b4c92cd646f2eaf920bdce7c9e07a77e4bfb2d8abda1e1a37e57;
        proof[2] = 0x87a408efd00a92ca31cc5a4c59cffef04e996b15cef170bf7455492f149b6fdb;
        proof[3] = 0x4f5a7ade6c94b4cb4b4637085856ce570672ee1c7c6c00a0949957949d10aca7;
        proof[4] = 0xe4caba460253f74c62fc6f7592db32d39e508699d1f4fe9a829e935b61a428c8;
        proof[5] = 0xe979986abfa02a732157df4ccdf704c73ebddc14b3f70e45c38ad3a3e4721004;
        proof[6] = 0xf0135a98653ac349c3fdf1b1066580098a6f1b384e7c3892491edd0f8987bf6b;
        proof[7] = 0x65008f026cb016875c9d919cce64e4d26d7b78825d872b753b1a5771d9589383;
        proof[8] = 0xcce28cd1e722112c62ee56e15c94d8e6210edfd9029df5568196031ed67073dd;
        proof[9] = 0xe92f0f35c01764c676380750ee33cd5b2014b2d87472863f5ff4a60be39f1877;
        proof[10] = 0xaf82e91879e7230b0c6a0f21bd03f1012030a3b3ac09bea86372f9d30664733a;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        vm.prank(alice);
        token.claim(0, alice, proof);
        assertEq(1, token.balanceOf(alice));

        token.stopFreeMint();
        vm.prank(cat);
        token.mint{value: 99 ether}();
        assertEq(1, token.balanceOf(cat));

        assertEq(0, admin.balance);
        vm.expectRevert("MimoFrenzyNFT: Mint not ended.");
        token.withdraw(payable(admin));

        token.stopMint();

        token.withdraw(payable(admin));
        assertEq(99 ether, admin.balance);

        vm.prank(pig);
        vm.expectRevert("MimoFrenzyNFT: Mint closed.");
        token.mint{value: 99 ether}();
        assertEq(0, token.balanceOf(pig));

        proof[0] = 0x33cbd54a90f74462793d081fd0fb9c9a91ac9aa2d52fdf525aace0ccb1909f4c;
        proof[1] = 0x3b149d3f0e901d490acdf0e096099de1ecb9811d261b0c4d3ef00c9c12795252;
        proof[2] = 0x723b79c88123cd8a2fa8ba686f62ac18490bd7a9020d34ef5aa8861eabff4780;
        proof[3] = 0x48f0a5c2a8b18daf9082c0b474b5ba55b659494edfd57ad5d8e8e48fdd253ae7;
        proof[4] = 0x928892a5a2945c654bde30860addd60198f7670513fde9938fdc1c2273125d14;
        proof[5] = 0xc6ccdb864bb63a92119a72e135f50a37b896f989bc6ad0ecdb8e0e3040e69d8e;
        proof[6] = 0x11870c4c26fe3d415fbc281e47b62062b8f0b424bc6db19d4f60b1563eb9f0f7;
        proof[7] = 0x75f389e0bcbf1bbe348a5300dca45665a6efe9742cfb9596e5412f28bd122d3a;
        proof[8] = 0x1ff729f1ef7238d5dd1ba1ce88509a16b6072adc803d9ea58a5e72a0220e6d76;
        proof[9] = 0x4513d6481bb1d98e2b15cefbe8c44cde44af31c2ac4c3306cd675b56f4d5ec31;
        proof[10] = 0x9879cff66dfe9b377ae2f18bd45f575177df41b1e2782987ea246338bcafe03f;
        proof[11] = 0x148d47c9e3df2f2b699cd69685afe418addb6e3cf0ea63c232f07374bff0014d;
        vm.expectRevert("MimoFrenzyNFT: Mint closed.");
        token.claim(2303, bob, proof);
        assertEq(0, token.balanceOf(bob));
    }
}
