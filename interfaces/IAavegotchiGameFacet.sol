// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import {LibAavegotchi, AavegotchiInfo} from "@gotchi/contracts/Aavegotchi/libraries/LibAavegotchi.sol";

interface IAavegotchiGameFacet {
    function interact(uint256[] calldata _tokenIds) external;

    function getAavegotchi(uint256 _tokenId)
        external
        view
        returns (AavegotchiInfo memory aavegotchiInfo_);
}
