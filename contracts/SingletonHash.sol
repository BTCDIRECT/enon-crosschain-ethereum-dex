/*
    Hash consumtion accounting.
*/

pragma solidity >= 0.5.0;

contract SingletonHash {
    event HashConsumed(bytes32 indexed hash);

    /**
     * @dev Used hash accounting
     */
    mapping(bytes32 => bool) public isHashConsumed;

    /**
     * @dev Parameter can be used only once
     * @param _hash Single usage hash
     */
    function singleton(bytes32 _hash) internal returns (bytes32) {
        require(!isHashConsumed[_hash]);
        isHashConsumed[_hash] = true;
        emit HashConsumed(_hash);
        return _hash;
    }
}
