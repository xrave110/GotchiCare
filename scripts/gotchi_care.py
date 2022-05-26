from brownie import interface, accounts, network, config
from scripts.helpful_scripts import get_account

MY_GOTCHI_ID = 24724


def get_gotchi_kingship(gotchi_contract):
    gotchi_contract = interface.IAavegotchiGameFacet(
        config["networks"][network.show_active()]["gotchi_contract"]
    )
    my_gotchi_stats = gotchi_contract.getAavegotchi(MY_GOTCHI_ID)
    print(my_gotchi_stats[12])


def interact_gotchi():
    account = get_account()
    gotchi_contract = interface.IAavegotchiGameFacet(
        config["networks"][network.show_active()]["gotchi_contract"]
    )
    get_gotchi_kingship(gotchi_contract)
    tx = gotchi_contract.interact([MY_GOTCHI_ID], {"from": account})
    tx.wait(1)
    get_gotchi_kingship(gotchi_contract)


def main():
    # gotchi_contract = interface.IAavegotchiGameFacet(
    #     config["networks"][network.show_active()]["gotchi_contract"]
    # )
    # get_gotchi_kingship(gotchi_contract)
    interact_gotchi()