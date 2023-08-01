use starknet::ContractAddress;
use array::ArrayTrait;

#[starknet::contract]
mod Funding {
    struct Project{
        u256 id;
        ContractAddress creator;
        felt252 description;
        felt252 title;
        u256 targetRaiseAmount;
        ContractAddress equityToken;
        u256 equityAmount;
        u256 currentRaiseAmount;
        u256 startTime;
        u256 endTime;
    }

    #[starknet::storage]
    struct Storage {
        contributions: LegacyMap::<u256, LegacyMap::<ContractAddress,u256>>,
        claimedEquity: LegacyMap::<u256, LegacyMap::<ContractAddress,bool>>,
        raiseToken: ContractAddress,
        projects: ArrayTrait::<Project>,
        lastProjectId: u256,
    }

    #[starknet::constructor]
    fn constructor(ref self: ContractState, _raiseToken: ContractAddress){
        self.raiseToken.write(_raiseToken);
        self.lastProjectId.write(0);
    }

    // #[event]
    // #[derive(Drop, starknet::Event)]
    // enum Event {
    //     StoredName: StoredName, 
    // }

    // #[derive(Drop, starknet::Event)]
    // struct StoredName {
    //     #[key]
    //     user: ContractAddress,
    //     name: felt252
    // }
}