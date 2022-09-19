import ExampleToken from "../../contracts/ExampleToken.cdc"
import FungibleTokenMetadataViews from "../../contracts/FungibleTokenMetadataViews.cdc"
import MetadataViews from "../../contracts/utilityContracts/MetadataViews.cdc"

pub fun main(address: Address): FungibleTokenMetadataViews.FTView{
  let account = getAccount(address)

  let vaultRef = account
    .getCapability(ExampleToken.ResolverPublicPath)
    .borrow<&{MetadataViews.Resolver}>()
    ?? panic("Could not borrow a reference to the vault resolver")

  let ftView = FungibleTokenMetadataViews.getFTView(viewResolver: vaultRef)

  return ftView

}